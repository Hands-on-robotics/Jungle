

describe('Home', () => {

  beforeEach(() => {
    cy.visit('http://localhost:3000')
  })

  it('should show the home page', () => {
    cy.visit('http://localhost:3000')
    cy.get('h3').should('have.text', 'Welcome to')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

})