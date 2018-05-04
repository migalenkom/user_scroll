describe('Users tests', function() {
  let firstname = Math.floor(Math.random() * 100) + "QA_user"
  let lastname = 'timeline_' + Math.floor(Math.random() * 100)
  let test_email = 'user_' + Math.floor(Math.random() * 100) + '@tqa.com'
  beforeEach(function() {
    cy.server()
    cy.visit('')
  })


  it('Header should contains action cable url', function() {
    cy.get('head meta[name="action-cable-url"]').should('have.attr', 'content')
  })

  it('Header should contains csrf', function() {
    cy.get('head meta[name="csrf-param"]').should('have.attr', 'content')
    cy.get('head meta[name="csrf-token"]').should('have.attr', 'content')
  })

  it('Check endless scroll', function() {
    cy.scrollTo('bottom')
    cy.route("GET", '/users*page=2*').as('get_second_page');
    cy.wait('@get_second_page')
  })


  it('Edit user', function() {
    cy.get('tbody tr:first').contains('Edit').click()
    cy.get('input[name="user[firstname]"]').clear().type(firstname)
    cy.get('input[type="submit"]').click()
    cy.get('#notice').should('contain', 'User was successfully updated.')
  })

  it('Create user', function() {
    cy.get('a').contains('New User').click()
    cy.get('input[name="user[firstname]"]').type(firstname)
    cy.get('input[name="user[lastname]"]').type(lastname)
    cy.get('input[name="user[email]"]').type(test_email)
    cy.get('input[type="submit"]').click()
    cy.get('#notice').should('contain', 'User was successfully created.')
  })


})
