import React from 'react';
import { SettingOutlined } from '@ant-design/icons';
import { Button, ConfigProvider, Input, Space } from 'antd';

const App: React.FC = () => (
  <ConfigProvider warning={{ strict: false }}>
    <Space vertical>
      Input addon Button:
      <Input addonAfter={<Button type="primary">Submit</Button>} defaultValue="mysite" />
      <Input addonAfter={<Button>Submit</Button>} defaultValue="mysite" />
      <br />
      <br />
      Input addon Button icon:
      <Input
        addonAfter={
          <Button>
            <SettingOutlined />
          </Button>
        }
        defaultValue="mysite"
      />
    </Space>
  </ConfigProvider>
);

export default App;
