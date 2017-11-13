import React, { Component } from 'react';
import { connect } from 'react-redux'

export default class Header extends Component {

  render() {
      return (
        <section id="banner" className="wrapper">
          <div className="inner">
            <div className="logo"><span className="icon fa-diamond"></span></div>
            <h2>{this.props.title}</h2>
            <p>{this.props.subtitle}</p>
          </div>
        </section>
      )
  }
}
