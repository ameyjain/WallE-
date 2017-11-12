import React, { Component } from 'react'
import { connect } from 'react-redux'

import $ from 'jquery';

export default class CheckoutProductDetails extends Component {

  render() {
    return (

      <div className="sidebar container">
      		<div className="row">
      			<div className="col-xs-12">


      <div className="order-summary-table hide-on-mobile">

      	<table className="table line-products">
      		<tbody>
      			<tr>
      				<td className="col-xs-2">
      					<div className="product-thumbnail-wrapper">
      						<div className="product-thumbnail">
      							<img src="/images/product_black.jpg" className="img-responsiv img-thumbnail"/>
      						</div>
      					</div>
      				</td>
      				<td className="product-title-wrapper">
      					<div className="product-title">AXIS Gear</div>
      					<div className="variant-title">Bluetooth</div>

      	        	<div className="text-muted">
      	        	  <small>
      	        	    <p>10% Deposit Now, 90% Due On Delivery</p>
      	        	  </small>
      	        	</div>
      				</td>
      				<td className="col-xs-2 line-item-total-wrapper">
      					<div className="line-total">$19.90</div>
      				</td>
      			</tr>

      		</tbody>
      	</table>

      	<hr/>
      	<div className="row order-calculation-row">
      		<div className="col-xs-8 text-left text-muted">Subtotal</div>
      		<div className="col-xs-4 text-right" data-cart-subtotal-price="">$19.90</div>
      	</div>
      	<div data-pretax-discount-lines="">

      	</div>
      	<div className="row order-calculation-row">
      		<div className="col-xs-8 text-left text-muted">Shipping</div>
      		<div className="col-xs-4 text-right">Free</div>
      	</div>
      	<div className="row order-calculation-row">
      		<div className="col-xs-8 text-left text-muted">Taxes</div>
      		<div className="col-xs-4 text-right" data-cart-total-tax="">—</div>
      	</div>
      	<div data-posttax-discount-lines="">

      	</div>

      	<hr/>
      	<div className="row order-total-row">
      		<div className="col-xs-8 text-left">
      			<strong>Due Now</strong><br/>
      		</div>
      		<div className="col-xs-4 text-right">
      			<span className="text-muted" data-cart-currency="">USD</span>
      			<span className="cart-total-price" data-cart-total-price="">$19.90</span>
      		</div>
      	</div>
      	<div className="row order-total-row">
      		<div className="col-xs-8 text-left">
      			<div className="text-muted">Charged When Shipped</div>
      		</div>
      		<div className="col-xs-4 text-right">
      			<span className="text-muted" data-cart-currency="">USD</span>
      			<span className="text-muted" data-cart-total-price="">$179.10</span>
      		</div>
      	</div>
      </div>
      			</div>
      		</div>
      	</div>
    );
  }
}
