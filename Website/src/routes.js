import React from 'react';
import { Route, IndexRoute } from 'react-router';

// Import miscellaneous routes and other requirements
import App from './components/App';

// Import static pages
import Home from './pages/Static/home';
import About from './pages/Static/about';
import Contact from './pages/Static/contact';
import NotFound from './pages/Static/404_not_found';

// Import authentication related pages
import Register from './pages/Auth/register';
import Login from './pages/Auth/login';
import Logout from './components/Auth/logout';

// Import user related pages
import Dashboard from './pages/User/dashboard';
import Users from './pages/User/all_users';
import UserDetail from './pages/User/user_detail';

export default (
  <Route  component={App}>
    <Route path="/" component={Home} />
    <Route path="/about" component={About} />
    <Route path="/contact" component={Contact} />

    <Route path="/login" component={Login} />
    <Route path="/logout" component={Logout} />
    <Route path="/register" component={Register} />

    <Route path="/dashboard" component={Dashboard} />
    <Route path="/users" component={Users} />
    <Route path="/users/:id" component={UserDetail} />

    <Route path="*" component={NotFound} />
  </Route>
);
