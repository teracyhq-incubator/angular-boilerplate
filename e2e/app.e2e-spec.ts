import { AngularBoilerplatePage } from './app.po';

describe('angular-boilerplate App', () => {
  let page: AngularBoilerplatePage;

  beforeEach(() => {
    page = new AngularBoilerplatePage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
