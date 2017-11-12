import React, { Component } from 'react'
import { connect } from 'react-redux'
import { Header } from '../Header'
import { CartItem } from '.'
import { Footer } from '../Footers'

import $ from 'jquery';

export default class CartContent extends Component {

  render() {
    return (
      <div id="cart-content">
        <Header title="My Cart"/>
        <Footer />
      </div>
    );
  }
}
