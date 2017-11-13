import React, { Component } from 'react'
import { connect } from 'react-redux'

import { Footer } from '../Footers'
import { Header } from '../Header'
import { NavBar } from '../Header'
import { Creators } from '.'
import { InfoGrid } from '.'
import { HowItWorks } from '.'
import { DesignHeading } from '.'
import { DesignDetails } from '.'

import $ from 'jquery';

export default class HomeContent extends Component {

  render() {
    return (
      <div id="page-wrapper">

          <NavBar />

          <Header title="Wall-e Inc." subtitle="YOUR HOME JUST GOT TWICE AS SMART." bgColor="#FFF"/>

          <DesignHeading />

          <InfoGrid />

          <HowItWorks />

          <DesignDetails />

          <Creators />

          <Footer/>

      </div>
    );
  }
}
