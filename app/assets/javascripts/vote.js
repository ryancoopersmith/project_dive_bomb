upvote = (upvotes, downvotes, voter_id, current_user) => {
  let canVote = true;
  voter_id.forEach((voter) => {
    if (current_user.id === voter) {
      canVote = false;
    }
  })
  if (canVote) {
    let requestData = {
      method: 'PUT',
      url: '/api/v1/bars.json',
      data: { upvotes: upvotes,
        downvotes: downvotes,
        voter_id: voter_id
      }
    };

    let request = $.ajax(requestData)
    request.done((response) => {
      return response;
    })
  } else {
    return 'You cannot vote more than once';
  }
};

downvote = (upvotes, downvotes, voter_id, current_user) => {
  let canVote = true;
  voter_id.forEach((voter) => {
    if (current_user.id === voter) {
      canVote = false;
    }
  })
  if (canVote) {
    let requestData = {
      method: 'PUT',
      url: '/api/v1/bars.json',
      data: { upvotes: upvotes,
        downvotes: downvotes,
        voter_id: voter_id
      }
    };

    let request = $.ajax(requestData)
    request.done((response) => {
      return response;
    })
  } else {
    return 'You cannot vote more than once';
  }
};
