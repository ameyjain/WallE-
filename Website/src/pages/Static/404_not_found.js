import React, { Component } from 'react';
import Header from '../../components/Header/static_header';

export default class Contact extends Component {
  render() {
    return (
      <div>
        <Header />
        <div className="container">
          <div className="jumbotron">
            <h1>404 Error</h1>
            <p>We can't seem to find the page you're looking for.</p>
          </div>
        </div>
      </div>
    );
  }
}
