import React, { Component } from 'react'
import { connect } from 'react-redux'

import $ from 'jquery';

export default class CheckoutForm extends Component {

  render() {
    return (
      <div >

        <form method="post" action="#">
          <h3>Customer information</h3>
          <div className="field">
            <input type="email" name="email" id="email" placeholder="Email" />
          </div>
        </form>

        <form method="post" action="#">
          <h3>Shipping Address</h3>
          <div className="field half first">
            <input type="text" name="name" id="first_name" value="" placeholder="First Name" />
          </div>
          <div className="field half">
            <input type="text" name="name" id="last_name" value="" placeholder="Last Name" />
          </div>
          <div className="field">
            <input type="text" name="name" id="company_name" value="" placeholder="Company (optional)" />
          </div>
          <div className="field first">
            <input type="text" name="name" id="address" value="" placeholder="Address" />
          </div>
          <div className="field half first">
            <input type="text" name="name" id="adress_2" value="" placeholder="Apt, suite, etc. (optional)" />
          </div>
          <div className="field half">
            <input type="text" name="name" id="city" value="" placeholder="City" />
          </div>
          <div className="field third first">
            <select name="Country" id="Country">
  															<option value="">- Country -</option>
  															<option value="1">USA</option>
  															<option value="2">CANADA</option>
  					</select>
          </div>
          <div className="field third">
            <select name="State/Province" id="State/Province">
  															<option value="">- State -</option>
  															<option value="1">California</option>
  															<option value="2">New York</option>
  					</select>
          </div>
          <div className="field third">
            <input type="text" name="name" id="name" value="" placeholder="Zip code" />
          </div>
          <div className="field">
            <input type="tel" name="name" id="phone_number" value="" placeholder="Phone (optional)" />
          </div>
          <ul className="actions vertical">
          <li><a href="#first" className="button big wide smooth-scroll-middle special">Proceed to Payment</a></li>
          </ul>
        </form>
      </div>
    );
  }
}
