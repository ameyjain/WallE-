import React, { Component } from 'react'
import { connect } from 'react-redux'

import $ from 'jquery';

export default class CartItem extends Component {

  render() {
    return (
      <div className="row cart-item-row">
  <form action="/update/51?source=inline&amp;subscription=true" method="post">
    <div className="col-md-2 col-xs-4">
      <div className="product-thumbnail">
        <a href="https://teamaxis.myshopify.com/products/axis-gear">
        <img src={this.props.image} className="img-responsive img-rounded"/>
        </a>
      </div>
    </div>
    <div className="col-md-6 col-xs-8">
      <div className="product-title">
        <p>
          <b><a href="https://teamaxis.myshopify.com/products/axis-gear">AXIS Gear</a></b><br/>
          Bluetooth
        </p>
        <p className="text-muted">10% Deposit Now, 90% Due On Delivery</p>
      </div>
    </div>
    <div className="clearfix visible-xs visible-sm"></div>
    <div id="price-div" className="col-md-1 col-xs-4 text-center">
      <div className="cart-mobile">Price: </div>
      $19.90
      </div>
    <div id="update-div" className="col-md-1 col-xs-3 text-center">
      <input type="number" name="quantity" className="form-control text-center" value="2"/>
      <button type="submit" className="btn btn-link btn-cart-mobile">
        <small>Update</small>
      </button>
    </div>
    <div id="cross-div" className="col-md-1 col-xs-2 text-center">
      <a href="/remove/51/sub/8">
      <i className="fa fa-times"></i>
      </a>
    </div>
    <div id="total-div" className="col-md-1 col-xs-3 text-right">
      <div className="cart-mobile">Total: </div>
      $39.80
    </div>
    <input type="hidden" name="authenticity_token" value="TKKeuZzpmvCy8YCxAsI2wobVqmNI6AhxA+9z5lbQRnW4y50Yxhl64LMvMyFgbxbLxUvYeEi8OTrmfWuRDLeVRQ=="/>
  </form>
</div>
      );
  }
}
