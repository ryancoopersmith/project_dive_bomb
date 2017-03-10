import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import BarList from './components/BarList';

$(function() {
  if (window.location.pathname === '/' || window.location.pathname === '/bars') {
    reactDOM.render(
      <BarList />,
      document.getElementById('bars')
    );
  }
  else if (window.location.pathname.match(/^\/bars\/[0-9]+$/)) {
    reactDOM.render(
      <ReviewList />,
      document.getElementById('reviews')
    );
  }
});
