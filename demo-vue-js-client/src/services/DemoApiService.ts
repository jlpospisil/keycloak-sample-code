class DemoApiService {
  private readonly getAuthToken: () => string;

  private readonly baseUrl: string = process.env.VUE_APP_DEMO_API_BASE_URL;

  constructor(getAuthToken: () => string) {
    this.getAuthToken = getAuthToken;
  }

  public async getDemoContent() {
    const response = await fetch(`${this.baseUrl}/demo-read`, {
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'include',
      referrerPolicy: 'no-referrer',
      headers: {
        'Content-Type': 'application/json',
        Authorization: this.getAuthToken(),
      },
    });
    return response.json();
  }
}

export default DemoApiService;
