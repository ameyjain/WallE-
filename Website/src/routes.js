import React from 'react';
import { Route, IndexRoute } from 'react-router';

// Import miscellaneous routes and other requirements
import App from './components/App';

// Import static pages
import Home from './pages/Static/home';
import About from './pages/Static/about';
import Contact from './pages/Static/contact';
import NotFound from './pages/Static/404_not_found';

export default (
  <Route  component={App}>
    <Route path="/" component={Home} />
    <Route path="/about" component={About} />
    <Route path="/contact" component={Contact} />
    <Route path="*" component={NotFound} />
  </Route>
);
