import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import BarList from './components/BarList';
import ReviewList from './components/ReviewList'

$(function() {
  ReactDOM.render(
    <BarList />,
    document.getElementById('bars')
  );
});
//
// $(function() {
//   ReactDOM.render(
//     <ReviewList />,
//     document.getElementById('reviews')
//   );
// });
