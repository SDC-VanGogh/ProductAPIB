const router = require('express').Router();
const controller = require('./controller.js');

// Product Routes
router.get('/products', controller.getProductList);
router.get('/products/:product_id', controller.getProduct);
router.get('/products/:product_id/styles', controller.getStyles);

// Related Product Routes
router.get('/products/:product_id/related', controller.getRelated);
// router.get('/products/:product_id/relatedData', controller.products.getRelatedData);

// Cart Routes
router.get('/cart', controller.getCart);
// router.post('/cart', controller.cart.addCart);

module.exports = router;