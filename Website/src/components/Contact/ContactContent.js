import React, { Component } from 'react'
import { connect } from 'react-redux'

import { Footer } from '../Footers'
import { FAQSection } from '.'
import { ContactDetails } from '.'
import { Header } from '../Header'
import { NavBar } from '../Header'

import $ from 'jquery';

export default class ContactContent extends Component {

  render() {
    return (
      <div id="page-wrapper">

      <NavBar />
      
      <Header title="Get Support" />

      <section id="contact-content">
        <div className="inner">
          <section className="middle">
            <ContactDetails/>
          </section>
          <aside className="sidebar">
            <FAQSection/>
          </aside>
        </div>
      </section>
      <Footer />
      </div>
    );
  }
}
