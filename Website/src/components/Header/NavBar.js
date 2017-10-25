import React, { Component } from 'react';
import { connect } from 'react-redux'

export default class NavBar extends Component {

  render() {
      return (
        <div>
          <header id="header" className="alt">
            <h1><a href="index.html">Wall-e Inc.</a></h1>
            <nav>
              <a href="menu">Home</a>
              <a href="menu">Newsletters</a>
              <a href="menu">Buy Now</a>
              <a href="menu">Cart</a>
            </nav>
          </header>

          <nav id="menu">
            <div className="inner">
              <h2>Menu</h2>
              <ul className="links">
                <li><a href="index.html">Home</a></li>
                <li><a href="generic.html">About us</a></li>
                <li><a href="elements.html">FAQ</a></li>
                <li><a href="#">Cart</a></li>
              </ul>
              <a href="#" className="close">Close</a>
            </div>
          </nav>
        </div>
      )
  }
}
