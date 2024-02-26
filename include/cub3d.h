/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   cub3d.h                                            :+:    :+:            */
/*                                                     +:+                    */
/*   By: tcensier <tcensier@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2024/02/26 11:16:42 by tcensier      #+#    #+#                 */
/*   Updated: 2024/02/26 13:47:36 by tcensier      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#ifndef CUB3D_H
# define CUB3D_H
# include "../MLX42/include/MLX42/MLX42.h"
# include "../libft/includes/libft.h"
# include <unistd.h>
# include <stdio.h>
# include <math.h>

typedef struct		s_data
{
	mlx_t			*mlx;
	mlx_image_t		*img;
}					t_data;


#endif