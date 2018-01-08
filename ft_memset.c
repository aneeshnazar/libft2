/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memset.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anazar <anazar@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/06/06 09:54:28 by anazar            #+#    #+#             */
/*   Updated: 2018/01/07 22:23:47 by anazar           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <libft.h>

void				*ft_memset(void *b, int c, size_t len)
{
	size_t			*str;
	size_t			i;
	size_t			len_mod;
	size_t			arr[5];

	i = 0;
	len_mod = len / 4;
	str = b;
	arr[0] = c + (c << 8) + (c << 16) + (c << 24);
	arr[1] = arr[0] % 0x100;
	arr[2] = arr[0] % 0x10000;
	arr[3] = arr[0] % 0x1000000;
	while (i < len_mod)
	{
		str[i] = arr[0];
		++i;
	}
	if (len % 4)
		str[i] = arr[len % 4];
	return (b);
}
