import React, { Component } from 'react'
import { connect } from 'react-redux'

import $ from 'jquery';

export default class FAQ extends Component {

  render() {
    return (
      <div className="accordion-list-item">
          <input id={this.props.qid} type="checkbox" name="tabs" className="accordion-header"/>
          <label htmlFor={this.props.qid}>{this.props.question}</label>
          <div className="tab-content accordion-content">
              <p>{this.props.answer}</p>
          </div>
      </div>
      );
  }
}
