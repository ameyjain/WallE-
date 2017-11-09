import React, { Component } from 'react'
import { connect } from 'react-redux'

import { Footer } from '../Footers'
import { FAQ } from './FAQ'
import { ContactDetails } from './ContactDetails'

import $ from 'jquery';

export default class ContactContent extends Component {

  render() {
    return (
      <div id="page-wrapper">

          <Footer/>

      </div>
    );
  }
}
