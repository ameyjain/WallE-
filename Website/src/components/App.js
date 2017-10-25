import React, { Component } from 'react'
import { Footer } from './Footers'
import { Header } from './Header'
import { NavBar } from './Header'
import { Creators } from './Home'
import { InfoGrid } from './Home'

export default class App extends Component {
  render() {
    return (
      <div id="page-wrapper">

          <NavBar />

          <Header />

          <section id="one" className="tiles">
            <article>
              <div className="image">
                <img src="images/pic02.jpg" alt="" />
                <h2>A Movie in the Park:<br />Kung Fu Panda</h2>
              </div>

              <header className="major">
                <h3><a href="landing.html" className="link">Wall-e Home</a></h3>
                <p>Ipsum dolor sit amet</p>
              </header>
            </article>
          </section>

          <Creators />

          <InfoGrid />

          <Footer/>

      </div>
    );
  }
}
