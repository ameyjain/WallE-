import React, { Component } from 'react'
import { Footer } from './Footers'
import { Header } from './Header'
import { NavBar } from './Header'
import { Creators } from './Home'
import { InfoGrid } from './Home'
import { HowItWorks } from './Home'
import { DesignHeading } from './Home'
import { DesignDetails } from './Home'

import $ from 'jquery';

export default class App extends Component {

  render() {
    return (
      <div id="page-wrapper">

          <NavBar />

          <Header />

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
