

describe('Products Page', () => {

  beforeEach(() => {
    cy.visit('http://localhost:3000');
  });

  it("Can navigate to product details page by clicking on product", () => {
    cy.get(".products article").first().click();
    cy.url().should('include', '/products/');
  })

});