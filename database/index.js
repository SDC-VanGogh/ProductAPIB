const { Pool } = require('pg');
const pool = new Pool({
  user: 'postgres',
  host: '3.16.225.206',
  database: 'productAPI',
  password: 'test',
  port: 5432
})

module.exports = {
  productTest: (callback) => {
    pool.query('SELECT * FROM  product LIMIT 10', (err, res)=>{
      if(err) {
        throw err;
      }
      callback(null, res.rows)
    })
  },

  singleProduct: (id, callback) => {
    let queryStr = `SELECT
    json_build_object(
          'id', product.id,
          'name', product.name,
          'slogan', product.slogan,
          'description', product.description,
          'category', product.category,
          'default_price', product.default_price,
          'features', json_agg(json_build_object(
              'feature', features.feature,
              'value', features.value
              ))
          ) AS product
    FROM product, features
    WHERE product.id=${id}
    AND product.id = features.product_id
    GROUP BY product.id;`
    pool.query(queryStr, (err, res)=>{
      if(err) {
        throw err;
      }
      callback(null, res.rows)
    })
  },

  productStyles: (id, callback) => {
    let queryStr = `SELECT styles.productid, json_agg(json_build_object(
      'style_id', id,
      'name', name,
      'original_price', original_price,
      'sale_price', sale_price,
      'default?', default_style,
      'photos',

      (SELECT json_agg(json_build_object(
          'thumbnail_url', photos.thumbnail_url,
          'url', photos.url
        )) FROM photos WHERE photos.styleid = styles.id),
      'skus',

      (SELECT
          json_object_agg(id,
              json_build_object(
            'size', size,
            'quantity', quantity
              )
          ) as skus
        FROM skus
        WHERE skus.styleid = styles.id
            GROUP by styles.id)
      )) as results FROM styles
        WHERE styles.productId = 1
          GROUP BY styles.productid`
    pool.query(queryStr, (err, res)=>{
      if(err) {
        throw err;
      }
      callback(null, res.rows)
    })
  },


  relatedProducts: (id, callback) => {
    pool.query(`SELECT * from related WHERE current_product_id=${id}`, (err, res)=>{
      if(err) {
        throw err;
      }
      callback(null, res.rows)
    })
  },

  currentCart: (callback) => {
    pool.query('SELECT * from cart', (err, res)=>{
      if(err) {
        throw err;
      }
      callback(null, res.rows)
    })
  }
}