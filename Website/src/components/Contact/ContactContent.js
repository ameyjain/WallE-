import React, { Component } from 'react'
import { connect } from 'react-redux'

import { Footer } from '../Footers'
import { FAQ } from '.'
import { ContactDetails } from '.'

import $ from 'jquery';

export default class ContactContent extends Component {

  render() {
    return (
      <div id="page-wrapper">
      <section id="contact-content">
        <div className="inner">
          <section className="middle">
            <ContactDetails/>
          </section>
          <aside className="sidebar">
            <FAQ/>
          </aside>
        </div>
      </section>
      <Footer />
      </div>
    );
  }
}
