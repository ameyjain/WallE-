import React, { Component } from 'react';
import { connect } from 'react-redux'

export default class Header extends Component {

  render() {
      return (
        <section id="banner">
          <div className="inner">
            <div className="logo"><span className="icon fa-diamond"></span></div>
            <h2>This is Solid State</h2>
            <p>Another free + fully responsive site template by <a href="http://html5up.net">HTML5 UP</a></p>
          </div>
        </section>
      )
  }
}
