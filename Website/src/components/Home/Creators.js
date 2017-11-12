import React, { Component } from 'react';
import { connect } from 'react-redux'

export default class Creators extends Component {

  render() {
      return (
        <div className="wrapper align-center">
          <div className="inner">
            <h1 className="major">Creators</h1>
            <section className="profile">
              <article>
                <a href="#" className="image"><img src="images/pic04.jpg" alt="" /></a>
                <h3 className="major">Amey Jain</h3>
                <p>Co-founder</p>
              </article>
              <article>
                <a href="#" className="image"><img src="images/pic05.jpg" alt="" /></a>
                <h3 className="major">Shubhi Yede</h3>
                <p>Co-founder</p>
              </article>
            </section>
          </div>
        </div>
      )
  }
}
