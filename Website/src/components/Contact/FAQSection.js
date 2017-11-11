import React, { Component } from 'react'
import { connect } from 'react-redux'
import { FAQ } from '.'

import $ from 'jquery';

export default class FAQSection extends Component {

  render() {
    return (
      <div id="LoyFAQ" className="LoySection">
      <h1>FAQ</h1>
        <div className="accordion">
            <FAQ question="What is Yours Truly Shopbop Rewards?" answer="It's our loyalty program! We've designed it to give back to our best customers—a.k.a. YOU—because we are happy youre here."/>
            <FAQ question="What is Yours Truly Shopbop Rewards?" answer="It's our loyalty program! We've designed it to give back to our best customers—a.k.a. YOU—because we are happy youre here."/>
            <FAQ question="What is Yours Truly Shopbop Rewards?" answer="It's our loyalty program! We've designed it to give back to our best customers—a.k.a. YOU—because we are happy youre here."/>
        </div>
        </div>
      );
  }
}
