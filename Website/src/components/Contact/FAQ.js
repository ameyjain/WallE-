import React, { Component } from 'react'
import { connect } from 'react-redux'

import $ from 'jquery';

export default class FAQ extends Component {

  render() {
    return (
      <div id="LoyFAQ" className="LoySection">
      <h1>FAQ</h1>
        <div className="accordion">
              <div className="accordion-list-item">
                  <input id="a-whatIsYTSR" type="checkbox" name="tabs" className="accordion-header"/>
                  <label htmlFor="a-whatIsYTSR">What is Yours Truly Shopbop Rewards?</label>
                  <div className="tab-content accordion-content">
                      <p>It's our loyalty program! We've designed it to give back to our best customers—a.k.a. YOU—because we are happy youre here.</p>
                  </div>
              </div>
              <div className="accordion-list-item">
                  <input id="a1-whatIsYTSR" type="checkbox" name="tabs" className="accordion-header"/>
                  <label htmlFor="a1-whatIsYTSR">What is Yours Truly Shopbop Rewards?</label>
                  <div className="tab-content accordion-content">
                      <p>It's our loyalty program! We've designed it to give back to our best customers—a.k.a. YOU—because we are happy youre here.</p>
                  </div>
              </div>
              <div className="accordion-list-item">
                  <input id="a2-whatIsYTSR" type="checkbox" name="tabs" className="accordion-header"/>
                  <label htmlFor="a2-whatIsYTSR">What is Yours Truly Shopbop Rewards?</label>
                  <div className="tab-content accordion-content">
                      <p>It's our loyalty program! We've designed it to give back to our best customers—a.k.a. YOU—because we are happy youre here.</p>
                  </div>
              </div>
        </div>
        </div>

      );
  }
}
