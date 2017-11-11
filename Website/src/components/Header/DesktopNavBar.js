import React, { Component } from 'react';
import { connect } from 'react-redux'

export default class DesktopNavBar extends Component {

  render() {
    return (
      <div>
        <header id="header" className="alt">
          <h1><a href="/">Wall-e Inc.</a></h1>
          <nav>
            <a href="menu">Home</a>
            <a href="menu">Newsletters</a>
            <a href="menu">Buy Now</a>
            <a href="menu">Cart</a>
          </nav>
        </header>
      </div>
    )
  }
}
