import React, { Component } from 'react'
import { connect } from 'react-redux'

import { Footer } from '../Footers'
import { Header } from '../Header'
import { CheckoutForm } from '.'
import { CheckoutProductDetails } from '.'
import { NavBar } from '../Header'

import $ from 'jquery';

export default class CheckoutContent extends Component {

  render() {
    return (

      <div>

        <NavBar />

        <Header title="Checkout" />

        <div className="flexbox-container">
          <CheckoutProductDetails />
          <div className="main container">
            <CheckoutForm />
          </div>
        </div>

        <Footer />
      </div>
    );
  }
}
