$(function() {
  var ProductGallery = {
    updateMainImage: function(main, dom) {
      dom.mainImage.data("previous-src", $.inArray(main, dom.images));

      dom.mainImage.attr('src', main.src);
      dom.mainImage.attr('alt', main.alt);
    }
  };

  var ProductButton = {
    tooltipSetup: function(dom) {
      if (dom.variantInput.val() === '') {
        var keys = [];
        for (var o in dom.defaultOptions) {
          keys.push(o);
        }

        var tooltipMessage = "Please select " + keys.join(", ") + " to add to the Shipping Cart";
        dom.addToCartButton.attr('title', tooltipMessage);
      } else {
        dom.addToCartButton.attr('title', '');
      }
    },

    setOutOfStock: function(object, dom) {
      var selectedCount = parseInt(dom.quantityInput.val(), 10);

      if (dom.product.track_inventory) {
        var note = "";

        if (selectedCount > object.quantity) {

          if (!dom.product.backorderable) {
            note += "Out of stock";

            dom.addToCartButton.hide();
            dom.variantInput.val('');
          }
        } else {
          dom.addToCartButton.show();
        }

        dom.outOfStockLabel.html(note);
      }
    }
  };

  var ProductOptions = {
    init: function(select, dom) {
      if (select.name === dom.selects[0].name && select.value === '') {

        for (var x = 0; x < dom.tailSelects.length; x++) {
          var name = dom.tailSelects[x].name.split("-")[1];
          this.rebuild(dom.tailSelects[x], dom.defaultOptions[name]);
        }

        this.emptyVariantFields(dom);
        ProductButton.tooltipSetup(dom);
        return;
      }

      if (select.value !== '') {
        this.setDependentOptions(select, dom);
      }

      this.lookUpVariantMatch(dom);
      ProductButton.tooltipSetup(dom);
    },

    setDependentOptions: function(current, dom) {
      var current_name = current.name.split("-")[1];

      for (var x = 0; x < dom.tailSelects.length; x++) {
        var name = dom.tailSelects[x].name.split("-")[1];
        var possible_values = [];

        if (name === current_name || current.value === '') {
          continue;
        }

        for (var i = 0; i < dom.variants.length; i++) {
          if (dom.variants[i].options[current_name] == current.value) {
            possible_values.push(dom.variants[i].options[name]);
          }
        }

        this.rebuild(dom.tailSelects[x], possible_values);
      }
    },

    lookUpVariantMatch: function(dom) {
      var optionNames = [];
      var optionValues = [];

      for (var i = 0; i < dom.selects.length; i++) {
        optionNames.push(dom.selects[i].name.split("-")[1]);
        optionValues.push(dom.selects[i].value);
      }

      for (var i = 0; i < dom.variants.length; i++) {
        var matches = 0;

        for (var x = 0; x < optionNames.length; x++) {

          if (dom.variants[i].options[optionNames[x]] == optionValues[x]) {
            matches++;

            if (matches != optionNames.length) {
              continue;
            }

            dom.currentVariant = dom.variants[i];
            this.setVariantFields(dom.variants[i], dom);
            return;
          }
        }
      }

      this.emptyVariantFields(dom);
    },

    setVariantFields: function(variant, dom) {
      dom.productPrice.html("$" + variant.price);
      dom.variantInput.val(variant.id);

      if (variant.image.url) {
        dom.mainImage.attr('src', variant.image.url);
        dom.mainImage.attr('alt', variant.image.title);

        for (var k = 0; k < dom.images.length; k++) {
          if (variant.image.url == dom.images[k].src) {
            dom.mainImage.data("previous-src", k);
          }
        }
      } else {
        dom.mainImage.data("previous-src", 0);
      }

      ProductButton.setOutOfStock(variant, dom);
    },

    rebuild: function(select, values) {
      var jselect = $(select);
      var name = select.name.split("-")[1];
      var query = 'option:not(:first)';

      if ($.inArray(select.value, values) != -1) {
        query += ':not(:selected)';
      }

      jselect.children(query).remove();

      for (var i = 0; i < values.length; i++) {
        if (values[i] == select.value) {
          continue;
        }

        jselect.append($('<option>').text(values[i]).val(values[i]));
      }
    },

    emptyVariantFields: function(dom) {
      dom.outOfStockLabel.html('');
      dom.variantInput.val('');
    }
  };

  var ProductWidget = {
    settings: {
      product: JSON.parse($("#product-trackinfo-json").html()),
      defaultOptions: JSON.parse($("#options-json").html()),
      variants: JSON.parse($("#variants-json").html()),

      selects: $("#product-variants select"),
      tailSelects: $("#product-variants select").splice(1, Number.MAX_VALUE),

      images: $(".product-images"),
      mainImage: $("#product-main-image"),

      productPrice: $("#product-price"),
      variantInput: $("#variant-id"),
      outOfStockLabel: $("#out-of-stock"),
      addToCartButton: $("#add-to-cart-button"),

      quantityInput: $("#product-quantity-input"),
      currentVariant: null, // NOTE feel like theres something quite wrong about this

      form: $("#add-to-cart")
    },

    init: function() {
      var dom = this.settings;

      dom.mainImage.data("previous-src", 0);
      dom.addToCartButton.tooltip();

      if (dom.selects.length > 0) {
        ProductButton.tooltipSetup(dom);
      }

      if (dom.variants.length === 0) {
        ProductButton.setOutOfStock(dom.product, dom);
      }

      this.bindUIActions(dom);
    },

    bindUIActions: function(dom) {
      dom.images.hover(
        function() {
          dom.mainImage.attr('src', this.src);
          dom.mainImage.attr('alt', this.alt);
        }, function() {
          var index = dom.mainImage.data('previous-src');

          dom.mainImage.attr('src', dom.images[index].src);
          dom.mainImage.attr('alt', dom.images[index].alt);
        }
      );

      dom.images.click(function() {
        ProductGallery.updateMainImage(this, dom);
      });

      dom.form.submit(function() {
        return dom.selects.length === 0 || dom.variantInput.val() !== '';
      });

      dom.quantityInput.change(function() {
        if (dom.currentVariant !== null) {
          ProductButton.setOutOfStock(dom.currentVariant, dom);
        } else {
          ProductButton.setOutOfStock(dom.product, dom);
        }
      });

      dom.selects.change(function() {
        ProductOptions.init(this, dom);
      });
    }
  };

  ProductWidget.init();
});
