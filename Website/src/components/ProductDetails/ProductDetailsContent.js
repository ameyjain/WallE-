import React, { Component } from 'react'
import { connect } from 'react-redux'

import { Footer } from '../Footers'
import { NavBar } from '../Header'
import { ProductSlideShow } from '.'

import $ from 'jquery';

export default class ProductDetailsContent extends Component {

  render() {
    return (
      <div id="page-wrapper">

        <NavBar />

        <ProductSlideShow/>
        <Footer />

      </div>
    );
  }
}
