import http from 'k6/http';
import { sleep } from 'k6';

export let options = {
  vus: 500,
  duration: '30s',
};

export default function () {
  let randomProduct = Math.floor(Math.random() * 100000 + 900000) + 1
  http.get(`http://localhost:3000/products/${randomProduct}`);
  sleep(1);
}