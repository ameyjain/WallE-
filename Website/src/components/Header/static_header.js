import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router';
import NavItem from './NavItem';

export default class StaticHeader extends Component {
  render() {
    return (
      <nav className="navbar navbar-default">
        <div className="container">
          <div className="navbar-header">
            <button type="button" className="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span className="sr-only">Toggle navigation</span>
              <span className="icon-bar"></span>
              <span className="icon-bar"></span>
              <span className="icon-bar"></span>
            </button>
            <Link
              to={`/`}
              className="navbar-brand">
                React Boilerplate
            </Link>
          </div>
          <div id="navbar" className="navbar-collapse collapse">
            <ul className="nav navbar-nav">
              <NavItem to="/">Home</NavItem>
              <NavItem to="/about">About</NavItem>
              <NavItem to="/contact">Contact</NavItem>
            </ul>
            <ul className="nav navbar-nav navbar-right">
              <NavItem to="/login">Login</NavItem>
              <NavItem to="/register">Register</NavItem>
            </ul>
          </div>
        </div>
      </nav>

    );
  }
}
