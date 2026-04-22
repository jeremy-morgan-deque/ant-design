import React from 'react';
import { Table } from 'antd';
import type { TableColumnsType, TableProps } from 'antd';

type TableRowSelection<T extends object = object> = TableProps<T>['rowSelection'];

interface DataType {
  key: React.Key;
  name: string;
}

const columns: TableColumnsType<DataType> = [
  {
    title: 'Name',
    dataIndex: 'name',
  },
];

const dataSource = Array.from({ length: 46 }).map<DataType>((_, i) => ({
  key: i,
  name: i % 2 === 0 ? `Edward King ${i}` : 'Another Row',
}));

const rowSelection: TableRowSelection<DataType> = {
  renderCell: (checked, _record, _index, node) => (
    <>
      {String(checked)}: {node}
    </>
  ),
  onCell: (_record, index) => ({
    rowSpan: index! % 2 === 0 ? 2 : 0,
  }),
};

const App: React.FC = () => (
  <Table<DataType> rowSelection={rowSelection} columns={columns} dataSource={dataSource} />
);

export default App;
