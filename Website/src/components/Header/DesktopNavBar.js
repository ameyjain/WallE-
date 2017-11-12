import React, { Component } from 'react';
import { connect } from 'react-redux'

export default class DesktopNavBar extends Component {

  render() {
    return (
      <div>
        <header id="header" className="alt">
          <h1><a href="/">Wall-e Inc.</a></h1>
          <nav>
            <a href="/">Home</a>
            <a href="/checkout">Buy Now</a>
            <a href="/contact">Contact</a>
            <a href="/contact">FAQ</a>
          </nav>
        </header>
      </div>
    )
  }
}
