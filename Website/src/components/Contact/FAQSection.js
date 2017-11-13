import React, { Component } from 'react'
import { connect } from 'react-redux'
import { FAQ } from '.'

import $ from 'jquery';

export default class FAQSection extends Component {

  render() {
    return (
      <div id="LoyFAQ" className="LoySection">
      <h2>FAQ</h2>
        <div className="accordion">
            <FAQ qid="1" question="What is Yours Truly Shopbop Rewards?" answer="It's our loyalty program! We've designed it to give back to our best customers—a.k.a. YOU—because we are happy youre here."/>
            <FAQ qid="2" question="What is Yours Truly Shopbop Rewards?" answer="It's our loyalty program! We've designed it to give back to our best customers—a.k.a. YOU—because we are happy youre here."/>
            <FAQ qid="3" question="What is Yours Truly Shopbop Rewards?" answer="It's our loyalty program! We've designed it to give back to our best customers—a.k.a. YOU—because we are happy youre here."/>
        </div>
        </div>
      );
  }
}
