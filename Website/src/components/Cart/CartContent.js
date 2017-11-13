import React, { Component } from 'react'
import { connect } from 'react-redux'
import { Header } from '../Header'
import { CartItem } from '.'
import { Footer } from '../Footers'
import { NavBar } from '../Header'


import $ from 'jquery';

export default class CartContent extends Component {
render() {
return (
  <div className="wrapper">
    <NavBar />
    <Header title="My Cart"/>

    <section className="inner">
      <div id="cart-content">
      <div className="flexbox-container">
        <div className="container" id="cart-container">
          <div className="shopping-cart">
            <div className="row cart-item-row hidden-xs hidden-sm">
              <div className="col-md-2"></div>
              <div className="col-md-6"></div>
              <div id="price-heading" className="col-md-1 text-center">Price</div>
              <div className="col-md-1 text-center">Quantity</div>
              <div className="col-md-1 text-center"></div>
              <div className="col-md-1 text-right">Total</div>
            </div>
            <CartItem image="/images/black_3.jpg"/>
            <CartItem image="/images/white_1.jpg"/>
            <div id="subtotal-section" className="row cart-item-row">
              <div className="col-xs-12 col-md-11 text-right">Only pay a refundable 10% deposit now:<br/>
                <small className="text-muted">Estimated shipping:</small><br/>
                <small className="text-muted">Bluetooth - January 2018</small><br/>
                <small className="text-muted">Smart Home - Spring 2018</small>
              </div>
              <div className="col-xs-12 col-md-1 text-right">$64.70</div>
            </div>
            <div className="row cart-item-row text-muted">
              <div className="col-xs-12 col-md-11 text-right">Balance Due Upon Shipping:</div>
              <div className="col-xs-12 col-md-1 text-right">$224.10</div>
            </div>
          </div>
          <div className="row">
            <div className="col-xs-12">
              <div className="text-right">
                <br/>
                <div className="pull-left">
                  <a href="https://shop.helloaxis.com/products/axis-gear" className="no-underline">
                  <i className="fa fa-caret-left fa-fw"></i>
                  Continue Shopping
                  </a>
                </div>
                <a href="/customer" className="btn btn-primary btn-submit btn-rounded btn-axis btn-submit-with-loader btn-block-on-mobile">
                Proceed to Checkout
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
      </div>
    </section>
    <Footer />
</div>
);
}
}
