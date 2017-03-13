import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import BarList from './components/BarList';
import ReviewList from './components/ReviewList'

$(function() {
  reactDOM.render(
    <BarList />,
    document.getElementById('bars')
  );
});

$(function() {
  reactDOM.render(
    <ReviewList />,
    document.getElementById('reviews')
  );
});
