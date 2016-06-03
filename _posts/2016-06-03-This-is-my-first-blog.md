---
layout: post
category : 杂文
tagline: 测试文章
tags : [测试, 杂文]
---
{% include JB/setup %}

# 测试

## 测试插入图片

![Test01](/assets/images/fig_0603.png)

## 测试插入附件

[我的个人简历（PDF）](/assets/files/file_0603.pdf)

## 测试公式

### 测试行间公式

$$ \alpha = \int_0^{\infty} x dx$$

### 测试行内公式

可以由公式$ \alpha = \int_0^{\infty} x dx$得出以上结论

## 测试代码高亮

Inline `code` has `back-ticks around` it.

```matlab
function c = sum(a, b)
  c = a + b;
  return c;
end
```

```c
void main()
{
	return 0;
}
```

```ruby
require 'redcarpet'
markdown = Redcarpet.new("Hello World!")
puts markdown.to_html
```