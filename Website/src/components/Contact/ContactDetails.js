import React, { Component } from 'react'
import { connect } from 'react-redux'

import $ from 'jquery';

export default class ContactDetails extends Component {

  render() {
    return (
      <div id="page-wrapper">
        <form method="post" action="#">
          <div class="field">
            <label for="name">Name</label>
            <input type="text" name="name" id="name" value="" />
          </div>
          <div class="field">
            <label for="email">Email</label>
            <input type="email" name="email" id="email" value="" />
          </div>
          <div class="field">
            <label for="message">Message</label>
            <textarea name="message" id="message" rows="6"></textarea>
          </div>
          <ul className="actions vertical">
          <li><a href="#first" className="button big wide smooth-scroll-middle special">Send Message</a></li>
          </ul>
        </form>
      </div>
    );
  }
}
