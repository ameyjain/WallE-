import React, { Component } from 'react';
import { connect } from 'react-redux'

export default class MobileNavBar extends Component {

  render() {
    return (
      <div>
        <header id="header" className="alt">
          <h1><a href="/">Solid State</a></h1>
          <nav>
            <a href="#menu">Menu</a>
          </nav>
        </header>

        <nav id="menu">
          <div className="inner">
            <h2>Menu</h2>
            <ul className="links">
              <li><a href="/">Home</a></li>
              <li><a href="/checkout">Buy Now</a></li>
              <li><a href="/contact">Contact</a></li>
              <li><a href="/contact">FAQ</a></li>
            </ul>
            <a href="#" className="close">Close</a>
          </div>
        </nav>
      </div>
    )
  }
}
