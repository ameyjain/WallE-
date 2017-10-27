import React, { Component } from 'react'
import { Footer } from './Footers'
import { Header } from './Header'
import { NavBar } from './Header'
import { Creators } from './Home'
import { InfoGrid } from './Home'
import $ from 'jquery';

export default class App extends Component {

  render() {
    return (
      <div id="page-wrapper">

          <NavBar />

          <Header />

          <section id="two" className="bg">
            <header className="major align-center">
              <h1>Simple & Intuitive Design</h1>
            </header>
          </section>

          <InfoGrid />

          <section id="two" className="bg" />

          <Creators />

          <Footer/>

      </div>
    );
  }
}
