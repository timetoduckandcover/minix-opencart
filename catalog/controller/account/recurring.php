<?php
class ControllerAccountRecurring extends Controller {
	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/order', '', 'SSL');

			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		}

		$this->language->load('account/recurring');

		$this->load->model('account/recurring');

		$this->document->setTitle($this->language->get('heading_title'));

		$url = '';

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_account'),
			'href'      => $this->url->link('account/account', '', 'SSL'),
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('account/recurring', $url, 'SSL'),
		);

		$data['heading_title'] = $this->language->get('heading_title');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_product'] = $this->language->get('column_product');
		$data['column_action'] = $this->language->get('column_action');
		$data['column_recurring_id'] = $this->language->get('column_recurring_id');
		$data['text_empty'] = $this->language->get('text_empty');
		$data['button_view'] = $this->language->get('button_view');
		$data['button_continue'] = $this->language->get('button_continue');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$data['orders'] = array();

		$recurring_total = $this->model_account_recurring->getTotalRecurring();

		$results = $this->model_account_recurring->getAllProfiles(($page - 1) * 10, 10);

		$data['recurrings'] = array();

		if ($results) {
			foreach ($results as $result) {
				$data['recurrings'][] = array(
					'id'                    => $result['order_recurring_id'],
					'name'                  => $result['product_name'],
					'status'                => $result['status'],
					'date_added'               => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
					'href'                  => $this->url->link('account/recurring/info', 'recurring_id=' . $result['order_recurring_id'], 'SSL'),
				);
			}
		}

		$data['status_types'] = array(
			1 => $this->language->get('text_status_inactive'),
			2 => $this->language->get('text_status_active'),
			3 => $this->language->get('text_status_suspended'),
			4 => $this->language->get('text_status_cancelled'),
			5 => $this->language->get('text_status_expired'),
			6 => $this->language->get('text_status_pending'),
		);

		$pagination = new Pagination();
		$pagination->total = $recurring_total;
		$pagination->page = $page;
		$pagination->limit = 10;
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('account/recurring', 'page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['continue'] = $this->url->link('account/account', '', 'SSL');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		// Sidebar data & text
		$data['text_my_account'] = $this->language->get('text_my_account');
		$data['text_my_orders'] = $this->language->get('text_my_orders');
		$data['text_my_newsletter'] = $this->language->get('text_my_newsletter');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_password'] = $this->language->get('text_password');
		$data['text_address'] = $this->language->get('text_address');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_reward'] = $this->language->get('text_reward');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
		$data['text_recurring'] = $this->language->get('text_recurring');
		$data['text_logout'] = $this->language->get('text_logout');

		$data['edit'] = $this->url->link('account/edit', '', 'SSL');
		$data['password'] = $this->url->link('account/password', '', 'SSL');
		$data['address'] = $this->url->link('account/address', '', 'SSL');
		$data['wishlist'] = $this->url->link('account/wishlist');
		$data['order'] = $this->url->link('account/order', '', 'SSL');
		$data['download'] = $this->url->link('account/download', '', 'SSL');
		$data['return'] = $this->url->link('account/return', '', 'SSL');
		$data['transaction'] = $this->url->link('account/transaction', '', 'SSL');
		$data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');
		$data['recurring'] = $this->url->link('account/recurring', '', 'SSL');
		$data['logout'] = $this->url->link('account/logout', '', 'SSL');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/recurring_list.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/recurring_list.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/recurring_list.tpl', $data));
		}
	}

	public function info() {
		$this->load->model('account/recurring');
		$this->load->language('account/recurring');

		if (isset($this->request->get['recurring_id'])) {
			$recurring_id = $this->request->get['recurring_id'];
		} else {
			$recurring_id = 0;
		}

		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/recurring/info', 'recurring_id=' . $recurring_id, 'SSL');

			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		}

		if (isset($this->session->data['error'])) {
			$data['error_warning'] = $this->session->data['error'];
			unset($this->session->data['error']);
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$recurring = $this->model_account_recurring->getProfile($this->request->get['recurring_id']);

		$data['status_types'] = array(
			1 => $this->language->get('text_status_inactive'),
			2 => $this->language->get('text_status_active'),
			3 => $this->language->get('text_status_suspended'),
			4 => $this->language->get('text_status_cancelled'),
			5 => $this->language->get('text_status_expired'),
			6 => $this->language->get('text_status_pending'),
		);

		$data['transaction_types'] = array(
			0 => $this->language->get('text_transaction_date_added'),
			1 => $this->language->get('text_transaction_payment'),
			2 => $this->language->get('text_transaction_outstanding_payment'),
			3 => $this->language->get('text_transaction_skipped'),
			4 => $this->language->get('text_transaction_failed'),
			5 => $this->language->get('text_transaction_cancelled'),
			6 => $this->language->get('text_transaction_suspended'),
			7 => $this->language->get('text_transaction_suspended_failed'),
			8 => $this->language->get('text_transaction_outstanding_failed'),
			9 => $this->language->get('text_transaction_expired'),
		);

		if ($recurring) {
			$recurring['transactions'] = $this->model_account_recurring->getProfileTransactions($this->request->get['recurring_id']);

			$recurring['date_added'] = date($this->language->get('date_format_short'), strtotime($recurring['date_added']));
			$recurring['product_link'] = $this->url->link('product/product', 'product_id=' . $recurring['product_id'], 'SSL');
			$recurring['order_link'] = $this->url->link('account/order/info', 'order_id=' . $recurring['order_id'], 'SSL');

			$this->document->setTitle($this->language->get('text_recurring'));

			$data['breadcrumbs'] = array();

			$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home'),
			);

			$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_account'),
				'href'      => $this->url->link('account/account', '', 'SSL'),
			);

			$url = '';

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('account/recurring', $url, 'SSL'),
			);

			$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_recurring'),
				'href'      => $this->url->link('account/recurring/info', 'recurring_id=' . $this->request->get['recurring_id'] . $url, 'SSL'),
			);

			$data['heading_title'] = $this->language->get('text_recurring');

			$data['column_date_added'] = $this->language->get('column_date_added');
			$data['column_type'] = $this->language->get('column_type');
			$data['column_amount'] = $this->language->get('column_amount');

			$data['text_recurring_id'] = $this->language->get('text_recurring_id');
			$data['text_date_added'] = $this->language->get('text_date_added');
			$data['text_empty_transactions'] = $this->language->get('text_empty_transactions');
			$data['text_payment_method'] = $this->language->get('text_payment_method');
			$data['text_recurring_detail'] = $this->language->get('text_recurring_detail');
			$data['text_status'] = $this->language->get('text_status');
			$data['text_ref'] = $this->language->get('text_ref');
			$data['text_product'] = $this->language->get('text_product');
			$data['text_order'] = $this->language->get('text_order');
			$data['text_quantity'] = $this->language->get('text_quantity');
			$data['text_transactions'] = $this->language->get('text_transactions');
			$data['text_recurring_description'] = $this->language->get('text_recurring_description');

			$data['recurring'] = $recurring;

			$data['buttons'] = $this->load->controller('payment/' . $recurring['payment_code'] . '/recurringButtons');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/recurring_info.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/recurring_info.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/account/recurring_info.tpl', $data));
			}
		} else {
			$this->response->redirect($this->url->link('account/recurring', '', 'SSL'));
		}
	}
}