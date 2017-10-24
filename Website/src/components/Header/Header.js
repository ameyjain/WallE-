import React, { Component } from 'react';
import { connect } from 'react-redux'

export default class Header extends Component {

  render() {
      return (
        <section id="banner">
          <div className="inner">
            <div className="logo"><span className="icon fa-diamond"></span></div>
            <h2>Wall-e Inc.</h2>
            <p>Your home just got twice as smart.</p>
          </div>
        </section>
      )
  }
}
