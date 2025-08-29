const state = {
  profile: {
    firstName: {
      value: '',
      touched: false,
    },
    lastName: {
      value: '',
      touched: false,
    },
    bio: {
      value: '',
      touched: false,
    },
  },
  errors: [],
};

/*
 * Handle form submission.
 */
function handleSubmit(event) {
  const formElem = event.currentTarget;

  // Prevent form from submitting
  event.preventDefault();

  // Mark all fields touched
  state.profile.firstName.touched = true;
  state.profile.lastName.touched = true;
  state.profile.bio.touched = true;

  doUpdate(formElem);

  // No errors. Save the data.
  if (state.errors.length === 0) {
    // In a real application, this is where we
    // would make an Ajax call or call or
    // form.submit() to save the form data.
    alert('No errors - we can save the data!');
  }
}

/*
 * Handle form input events.
 */
function handleInput(event) {
  const formElem = event.currentTarget;
  doUpdate(formElem);
}

/*
 * Triggered when the user leaves an input field.
 * This is how we know a field has been "touched"
 * by the user.
 */
function handleFocusOut(event) {
  const formElem = event.currentTarget;
  const inputElem = event.target;
  const field = state.profile[inputElem.name];
  if (field) {
    field.touched = true;
  }
  doUpdate(formElem);
}

/*
 * Read form data, validate it, and render any errors.
 */
function doUpdate(formElem) {
  // Read the form data and update the state
  const { firstName, lastName, bio } = state.profile;
  firstName.value = getInputVal(formElem, 'firstName');
  lastName.value = getInputVal(formElem, 'lastName');
  bio.value = getInputVal(formElem, 'bio');

  // Validate the new profile data
  state.errors = validateProfile(state.profile);

  // Re-render the field errors
  renderErrors(formElem, state);
}

/*
 * Validate the current profile values.
 */
function validateProfile(profile) {
  const errors = [];

  // Validate the 'first name' field
  if (!profile.firstName.value) {
    errors.push({
      field: 'firstName',
      message: 'Please enter your first name.',
    });
  }

  // Validate the 'last name' field
  if (!profile.lastName.value) {
    errors.push({
      field: 'lastName',
      message: 'Please enter your last name.',
    });
  }

  // Validate the 'bio' field
  const requiredWordCount = 8;
  const bioWordCount = profile.bio.value.split(' ')
                                        .filter(i => i !== '')
                                        .length;
  if (!profile.bio.value || bioWordCount < requiredWordCount) {
    const wordCountDiff = requiredWordCount - bioWordCount;
    errors.push({
      field: 'bio',
      message: (
        `Please write at least ${wordCountDiff} more word` +
        (wordCountDiff > 1 ? 's': '') + '.'
      ),
    });
  }

  return errors;
}

/*
 * Render error messages on the form, if any.
 */
function renderErrors(formElem, state) {
  // First remove any existing error messages
  const oldFieldErrors = formElem.querySelectorAll('.field-error');
  for (let err of oldFieldErrors) {
    err.parentNode.removeChild(err);
  }

  // Then add any current error messages
  state.errors.forEach(error => {
    const field = state.profile[error.field];
    // Only display errors if the field has been touched.
    if (field.touched) {
      const fieldErrorSpan = document.createElement('span');
      fieldErrorSpan.classList.add('field-error');
      fieldErrorSpan.innerHTML = error.message;
      formElem.querySelector(`[name="${error.field}"]`)
          .parentNode
          .appendChild(fieldErrorSpan);
    }
  });
}

function getInputVal(formElem, inputName) {
  return formElem.querySelector(`[name="${inputName}"]`).value;
}
