const db = require('../database/index.js');
const axios = require('axios');

module.exports = {
  getProductList: (req, res) => {
    db.productTest((err, result) => {
      if (err) {
        res.status(400)
        console.log(err);
      }
      res.status(200)
      res.send(result)
    });
  },

  getProduct: (req, res) => {
    let id = parseInt(req.params.product_id);
    db.singleProduct(id, (err, result) => {
      if (err) {
        res.status(400)
        console.log(err);
      }
      res.status(200)
      res.send(result)
    });
  },

  getStyles: (req, res) => {
    let id = parseInt(req.params.product_id);
    db.productStyles(id, (err, result) => {
      if (err) {
        res.status(400)
        console.log(err);
      }
      res.status(200)
      res.send(result)
    });
  },

  getPhotos: (req, res) => {
    let id = parseInt(req.params.product_id);
    db.productPhotos(id, (err, result) => {
      if (err) {
        res.status(400)
        console.log(err);
      }
      res.status(200)
      res.send(result)
    });
  },

  getRelated:  (req, res) => {
    let id = parseInt(req.params.product_id);
    db.relatedProducts(id, (err, result) => {
      if (err) {
        res.status(400)
        console.log(err);
      }
      res.status(200)
      res.send(result)
    });
  },

  getCart: (req, res) => {
    db.currentCart((err, result) => {
      if (err) {
        res.status(400)
        console.log(err);
      }
      res.status(200)
      res.send(result)
    });
  }
}