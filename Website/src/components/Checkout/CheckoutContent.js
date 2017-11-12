import React, { Component } from 'react'
import { connect } from 'react-redux'

import { Footer } from '../Footers'
import { Header } from '../Header'
import { CheckoutForm } from '.'
import { NavBar } from '../Header'

import $ from 'jquery';

export default class CheckoutContent extends Component {

  render() {
    return (

      <div id="page-wrapper">

        <NavBar />

        <Header title="Checkout" />

        <section id="contact-content">
          <div className="inner">
            <section className="middle">
              <CheckoutForm />
            </section>
            <aside className="sidebar">
              <CheckoutForm />
            </aside>
          </div>
        </section>

        <Footer />
      </div>
    );
  }
}
