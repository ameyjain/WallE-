import React, { Component } from 'react';
import { connect } from 'react-redux'

export default class BuyNow extends Component {

  render() {
      return (
        <div id="banner" className="major myBuyNowSection">
          <div className="inner">
            <header className="major">
              <h1>WALL-E</h1>
            </header>
            <div className="content">
              <p>Make you environment smart with wall-e</p>
              <ul className="actions">
                <li><a href="#one" className="button next">Buy Now</a></li>
              </ul>
            </div>
          </div>
        </div>
      )
  }
}
