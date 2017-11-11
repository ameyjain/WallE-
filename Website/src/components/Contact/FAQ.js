import React, { Component } from 'react'
import { connect } from 'react-redux'

import $ from 'jquery';

export default class FAQ extends Component {

  render() {
    return (
      <div className="accordion-list-item">
          <input id="a-whatIsYTSR" type="checkbox" name="tabs" className="accordion-header"/>
          <label htmlFor="a-whatIsYTSR">{this.props.question}</label>
          <div className="tab-content accordion-content">
              <p>{this.props.answer}</p>
          </div>
      </div>
      );
  }
}
