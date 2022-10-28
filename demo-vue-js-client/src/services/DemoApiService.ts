class DemoApiService {
  private readonly getAuthToken: () => string;

  private readonly baseUrl: string = process.env.VUE_APP_DEMO_API_BASE_URL;

  constructor(getAuthToken: () => string) {
    this.getAuthToken = getAuthToken;
  }

  public async getDemoReadContent() {
    const response = await fetch(`${this.baseUrl}/demo-read`, this.getRequestConfig());
    return response.json();
  }

  public async getDemoWriteContent() {
    const response = await fetch(`${this.baseUrl}/demo-write`, this.getRequestConfig());
    return response.json();
  }

  private getRequestConfig(): RequestInit {
    return {
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'include',
      referrerPolicy: 'no-referrer',
      headers: {
        'Content-Type': 'application/json',
        Authorization: this.getAuthToken(),
      },
    };
  }
}

export default DemoApiService;
